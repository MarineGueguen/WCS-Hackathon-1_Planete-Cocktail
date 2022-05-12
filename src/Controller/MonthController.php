<?php

namespace App\Controller;

use App\Model\MonthManager;

class MonthController extends AbstractController
{
    /**
     * List months
     */
    public function index(): string
    {
        $monthManager = new MonthManager();
        $months = $monthManager->selectAll('title');

        return $this->twig->render('Month/index.html.twig', ['months' => $months]);
    }

    /**
     * Show informations for a specific month
     */
    public function show(int $id): string
    {
        $monthManager = new MonthManager();
        $month = $monthManager->selectOneById($id);

        return $this->twig->render('Month/show.html.twig', ['month' => $month]);
    }

    /**
     * Edit a specific month
     */
    public function edit(int $id): ?string
    {
        $monthManager = new MonthManager();
        $month = $monthManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $month = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, update and redirection
            $monthManager->update($month);

            header('Location: /months/show?id=' . $id);

            // we are redirecting so we don't want any content rendered
            return null;
        }

        return $this->twig->render('Month/edit.html.twig', [
            'month' => $month,
        ]);
    }

    /**
     * Add a new month
     */
    public function add(): ?string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $month = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, insert and redirection
            $monthManager = new MonthManager();
            $id = $monthManager->insert($month);

            header('Location:/months/show?id=' . $id);
            return null;
        }

        return $this->twig->render('Month/add.html.twig');
    }

    /**
     * Delete a specific month
     */
    public function delete(): void
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id = trim($_POST['id']);
            $monthManager = new MonthManager();
            $monthManager->delete((int)$id);

            header('Location:/months');
        }
    }
}
