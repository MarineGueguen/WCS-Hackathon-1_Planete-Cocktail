<?php

namespace App\Model;

class MonthManager extends AbstractManager
{
    public const TABLE = 'month';
    /**
     * Select all months in database
     */
    public function selectAll(string $orderBy = '', string $direction = 'ASC'): array
    {
        $query = 'SELECT i.name AS ingredient, i.type_id, i.image, t.name AS type, m.name AS month  
        FROM ' . static::TABLE . ' AS m
        INNER JOIN month_ingredient AS mi
        ON mi.ingredient_id = m.id
        INNER JOIN ingredient AS i
        ON mi.month_id = i.id
        INNER JOIN type AS t 
        ON i.type_id = t.id';
        if ($orderBy) {
            $query .= ' ORDER BY ' . $orderBy . ' ' . $direction;
        }
        return $this->pdo->query($query)->fetchAll();
    }

    /**
     * Get one row from database by ID.
     */
    public function selectOneById(int $id): array|false
    {
        $statement = $this->pdo->prepare('SELECT i.name AS ingredient, i.type_id, i.image, 
        t.name AS type, m.name AS month  
        FROM ' . static::TABLE . ' AS m
        INNER JOIN month_ingredient AS mi
        ON mi.ingredient_id = m.id
        INNER JOIN ingredient AS i
        ON mi.month_id = i.id
        INNER JOIN type AS t 
        ON i.type_id = t.id
        WHERE m.id=:id');
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch();
    }

    /**
     * Insert new month in database
     */
    public function insert(array $month): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE . " (`name`) VALUES (:name)");
        $statement->bindValue('name', $month['name'], \PDO::PARAM_STR);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    /**
     * Update month in database
     */
    public function update(array $month): bool
    {
        $statement = $this->pdo->prepare("UPDATE " . self::TABLE . " SET `name` = :name WHERE id=:id");
        $statement->bindValue('id', $month['id'], \PDO::PARAM_INT);
        $statement->bindValue('name', $month['name'], \PDO::PARAM_STR);

        return $statement->execute();
    }
}
