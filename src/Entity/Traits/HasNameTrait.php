<?php

namespace App\Entity\Traits;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

trait HasNameTrait
{
    #[ORM\Column(length: 128)]
    private string $name = '';

    #[ORM\Column(length: 128, unique: true)]
    #[Gedmo\Slug(fields: ['name'], unique: true)]
    private string $slug = '';

    public function getName(): string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getSlug(): string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): static
    {
        $this->slug = $slug;

        return $this;
    }
}
