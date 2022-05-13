<?php

namespace App\Controller;

use App\Model\IngredientManager;
use App\Model\MonthIngredientManager;
use App\Model\MonthManager;

class IngredientController extends AbstractController
{
    public function welcome(): string
    {
        return $this->twig->render('Home/index1.html.twig');
    }

    /**
     * List ingredients
     */
    public function index(): string
    {
        $monthManager = new MonthManager();
        $monthIngredientManager = new MonthIngredientManager();
        setlocale(LC_TIME, "fr_FR");
        $month = date('m');
        $error = '';

        switch ($month) {
            case 1:
                $month = $monthManager->selectOneById(1);
                break;
            case 2:
                $month = $monthManager->selectOneById(2);
                break;
            case 3:
                $month = $monthManager->selectOneById(3);
                break;
            case 4:
                $month = $monthManager->selectOneById(4);
                break;
            case 5:
                $month = $monthManager->selectOneById(5);
                break;
            case 6:
                $month = $monthManager->selectOneById(6);
                break;
            case 7:
                $month = $monthManager->selectOneById(7);
                break;
            case 8:
                $month = $monthManager->selectOneById(8);
                break;
            case 9:
                $month = $monthManager->selectOneById(9);
                break;
            case 10:
                $month = $monthManager->selectOneById(10);
                break;
            case 11:
                $month = $monthManager->selectOneById(11);
                break;
            case 12:
                $month = $monthManager->selectOneById(12);
                break;
        }
        $ingredients = $monthIngredientManager->selectAllIngredientsByMonthId($month['id']);
        if (empty($ingredients)) {
            $error = "Ce mois-ci, ça va être difficile de manger cinq fruits et légumes par jour ...";
        }


        return $this->twig->render('Home/index.html.twig', ['ingredients' => $ingredients, 'month' => $month, 'error' => $error]);
    }

    public function indexByMonth(int $id): string
    {
        $monthManager = new MonthManager();
        $monthIngredientManager = new MonthIngredientManager();
        if ($id < 1) {
            $id = 12;
        } elseif ($id > 12) {
            $id = 1;
        }
        $month = $monthManager->selectOneById($id);
        $ingredients = $monthIngredientManager->selectAllIngredientsByMonthId($month['id']);

        return $this->twig->render('Home/index.html.twig', ['ingredients' => $ingredients, 'month' => $month]);
    }

    /**
     * Show informations for a specific ingredient
     */
    public function show(int $id): string
    {
        $ingredientManager = new IngredientManager();
        $ingredient = $ingredientManager->selectOneById($id);

        return $this->twig->render('Ingredient/show.html.twig', ['ingredient' => $ingredient]);
    }

    /**
     * Edit a specific ingredient
     */
    public function edit(int $id): ?string
    {
        $ingredientManager = new IngredientManager();
        $ingredient = $ingredientManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $ingredient = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, update and redirection
            $ingredientManager->update($ingredient);

            header('Location: /ingredients/show?id=' . $id);

            // we are redirecting so we don't want any content rendered
            return null;
        }

        return $this->twig->render('Ingredient/edit.html.twig', [
            'ingredient' => $ingredient,
        ]);
    }

    /**
     * Add a new ingredient
     */
    public function add(): ?string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $ingredient = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, insert and redirection
            $ingredientManager = new IngredientManager();
            $id = $ingredientManager->insert($ingredient);

            header('Location:/ingredients/show?id=' . $id);
            return null;
        }

        return $this->twig->render('Ingredient/add.html.twig');
    }

    /**
     * Delete a specific ingredient
     */
    public function delete(): void
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id = trim($_POST['id']);
            $ingredientManager = new IngredientManager();
            $ingredientManager->delete((int)$id);

            header('Location:/ingredients');
        }
    }
}
