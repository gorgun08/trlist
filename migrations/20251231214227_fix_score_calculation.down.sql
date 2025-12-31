-- Add down migration script here
CREATE OR REPLACE FUNCTION record_score(progress FLOAT, demon FLOAT, list_size FLOAT, requirement FLOAT) RETURNS FLOAT AS
$record_score$
SELECT CASE
           WHEN progress = 100 THEN
                   CASE
                       WHEN demon BETWEEN 84 AND 150 THEN
                            1.039035131 * ((185.7 * EXP((-0.02715 * demon))) + 14.84)
                       WHEN demon BETWEEN 54 AND 83 THEN
                            1.0371139743 * ((212.61 * POWER(1.036, 1 - demon)) + 25.071)
                       WHEN demon BETWEEN 31 AND 53 THEN
                            (((250 - 83.389) * POWER(1.0099685, 2 - demon) - 31.152)) * 1.0371139743
                       WHEN demon BETWEEN 6 AND 30 THEN
                            ((326.1 * EXP((-0.0871 * demon))) + 51.09) * 1.037117142
                       WHEN demon BETWEEN 1 AND 5 THEN
                            (-18.2899079915 * demon) + 368.2899079915
                   END
           WHEN progress < requirement THEN
               0.0
           ELSE
               CASE
                   WHEN demon BETWEEN 84 AND 150 THEN
                        1.039035131 * ((185.7 * EXP((-0.02715 * demon))) + 14.84) * (EXP(LN(5) * (progress - requirement) / (100 - requirement))) / 10
                   WHEN demon BETWEEN 54 AND 83 THEN
                        (1.0371139743 * ((212.61 * POWER(1.036, 1 - demon)) + 25.071)) * (EXP(LN(5) * (progress - requirement) / (100 - requirement))) / 10
                   WHEN demon BETWEEN 31 AND 53 THEN
                        (((250 - 83.389) * POWER(1.0099685, 2 - demon) - 31.152)) * 1.0371139743 * (EXP(LN(5) * (progress - requirement) / (100 - requirement))) / 10
                   WHEN demon BETWEEN 6 AND 30 THEN
                        (((326.1 * EXP((-0.0871 * demon))) + 51.09) * 1.037117142) * (EXP(LN(5) * (progress - requirement) / (100 - requirement))) / 10
                   WHEN demon BETWEEN 1 AND 5 THEN
                        ((-18.2899079915 * demon) + 368.2899079915) * (EXP(LN(5) * (progress - requirement) / (100 - requirement))) / 10
               END
           END;
$record_score$
     LANGUAGE SQL IMMUTABLE;
