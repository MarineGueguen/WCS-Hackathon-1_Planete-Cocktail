<?php

namespace App\Model;

class MonthIngredientManager extends AbstractManager
{
    public const TABLE = 'month_ingredient';

    public function selectAllIngredientsByMonthId(int $id): array|false
    {
        $statement = $this->pdo->prepare('SELECT i.name AS ingredient_name, i.image AS ingredient_image, 
        t.name AS type, i.is_local, i.id AS ingredient_id
        FROM ' . self::TABLE . ' AS mi
        INNER JOIN ingredient AS i
        ON mi.ingredient_id = i.id
        INNER JOIN type AS t
        ON i.type_id = t.id
        WHERE mi.month_id = :id AND i.type_id != 3');

        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetchAll();
    }

    public function selectMonthsByIngredientId(int $id): array|false
    {
        $statement = $this->pdo->prepare('SELECT m.name AS month
        FROM ' . self::TABLE . ' AS mi
        INNER JOIN month as m
        ON mi.month_id = m.id
        WHERE mi.ingredient_id = :id');

        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetchAll();
    }
}
