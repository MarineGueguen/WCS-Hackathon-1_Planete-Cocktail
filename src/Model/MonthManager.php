<?php

namespace App\Model;

class MonthManager extends AbstractManager
{
    public const TABLE = 'month';

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
