--https://www.beecrowd.com.br/judge/pt/problems/view/2988
WITH matches_numbers AS (
    SELECT
        t.id,
        COUNT(m.id) AS matches
    FROM
        teams t
    LEFT JOIN matches m ON t.id = m.team_1 OR t.id = m.team_2
    GROUP BY
        t.id
),
scores AS (
    SELECT
        t.name,
        COALESCE(mn.matches, 0) AS matches,
        COUNT(CASE WHEN (((t.id = m.team_1) and m.team_1_goals > m.team_2_goals) or ((t.id = m.team_2)and m.team_1_goals < m.team_2_goals)) THEN 1 END) AS victories,
        COUNT(CASE WHEN (((t.id = m.team_1) and m.team_1_goals < m.team_2_goals) or ((t.id = m.team_2)and m.team_1_goals > m.team_2_goals)) THEN 1 END) AS defeats,
        COUNT(CASE WHEN (((t.id = m.team_1) and m.team_1_goals = m.team_2_goals) or ((t.id = m.team_2)and m.team_1_goals = m.team_2_goals)) THEN 1 END) AS draws,
        COALESCE(COUNT(CASE WHEN (((t.id = m.team_1) and m.team_1_goals > m.team_2_goals) or ((t.id = m.team_2)and m.team_1_goals < m.team_2_goals)) THEN 1 END) * 3, 0) + 
        COALESCE(COUNT(CASE WHEN (((t.id = m.team_1) and m.team_1_goals = m.team_2_goals) or ((t.id = m.team_2)and m.team_1_goals = m.team_2_goals)) THEN 1 END), 0) AS score
    FROM
        teams t
    JOIN matches_numbers mn ON t.id = mn.id
    JOIN matches m ON t.id = m.team_1 OR t.id = m.team_2
    GROUP BY
        t.id,
        t.name,
        mn.matches
)
SELECT * FROM scores
ORDER BY score DESC;