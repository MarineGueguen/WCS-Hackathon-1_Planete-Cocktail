<?php

namespace App\Model;

class IngredientRecipeManager extends AbstractManager
{
    public const TABLE = 'recipe_ingredient';

    public function selectAllIngredientsByRecipeId(int $id): array|false
    {
        $statement = $this->pdo->prepare('SELECT i.name AS ingredient_name, i.image AS ingredient_image
        FROM ' . self::TABLE . ' AS ri
        INNER JOIN ingredient AS i
        ON ri.ingredient_id = i.id
        WHERE ri.recipe_id = :id');

        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetchAll();
    }

    public function selectAllRecipesByIngredientId(int $id): array|false
    {
        $statement = $this->pdo->prepare('SELECT DISTINCT r.name AS recipe_name, r.image AS recipe_image, 
        r.description AS recipe_steps, r.id AS recipe_id
        FROM recipe_ingredient AS ri
        INNER JOIN recipe AS r
        ON ri.recipe_id = r.id
        WHERE ri.ingredient_id = :id');

        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetchAll();
    }
}
