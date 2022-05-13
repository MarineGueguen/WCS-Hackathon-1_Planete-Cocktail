<?php

namespace App\Controller;

use App\Model\TypeManager;

class TypeController extends AbstractController
{
    /**
     * List types
     */
    public function index(): string
    {
        $typeManager = new TypeManager();
        $types = $typeManager->selectAll('title');

        return $this->twig->render('Type/index.html.twig', ['types' => $types]);
    }

    /**
     * Show informations for a specific type
     */
    public function show(int $id): string
    {
        $typeManager = new TypeManager();
        $type = $typeManager->selectOneById($id);

        return $this->twig->render('Type/show.html.twig', ['type' => $type]);
    }

    /**
     * Edit a specific type
     */
    public function edit(int $id): ?string
    {
        $typeManager = new TypeManager();
        $type = $typeManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $type = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, update and redirection
            $typeManager->update($type);

            header('Location: /types/show?id=' . $id);

            // we are redirecting so we don't want any content rendered
            return null;
        }

        return $this->twig->render('Type/edit.html.twig', [
            'type' => $type,
        ]);
    }

    /**
     * Add a new type
     */
    public function add(): ?string
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $type = array_map('trim', $_POST);

            // TODO validations (length, format...)

            // if validation is ok, insert and redirection
            $typeManager = new TypeManager();
            $id = $typeManager->insert($type);

            header('Location:/types/show?id=' . $id);
            return null;
        }

        return $this->twig->render('Type/add.html.twig');
    }

    /**
     * Delete a specific type
     */
    public function delete(): void
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id = trim($_POST['id']);
            $typeManager = new TypeManager();
            $typeManager->delete((int)$id);

            header('Location:/types');
        }
    }
}
