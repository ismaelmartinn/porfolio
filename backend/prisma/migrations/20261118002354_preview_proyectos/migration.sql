-- CreateEnum
CREATE TYPE "Estado" AS ENUM ('EN_DESARROLLO', 'TERMINADO', 'ARCHIVADO');

-- CreateEnum
CREATE TYPE "Categoria" AS ENUM ('PROPIO', 'CLASE', 'TRABAJO', 'FRONTEND_MENTOR');

-- AlterTable
ALTER TABLE "Proyecto" ADD COLUMN     "aprendizajes" TEXT[],
ADD COLUMN     "caracteristicas" TEXT[],
ADD COLUMN     "categoria" "Categoria" NOT NULL DEFAULT 'PROPIO',
ADD COLUMN     "descripcion_larga" TEXT,
ADD COLUMN     "destacado" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "estado" "Estado" NOT NULL DEFAULT 'TERMINADO',
ADD COLUMN     "orden" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "publicado" BOOLEAN NOT NULL DEFAULT true,
ALTER COLUMN "web_url" DROP NOT NULL,
ALTER COLUMN "github" DROP NOT NULL,
ALTER COLUMN "img_url" DROP NOT NULL;

-- CreateTable
CREATE TABLE "ProyectoImagen" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "alt" TEXT,
    "orden" INTEGER NOT NULL DEFAULT 0,
    "proyecto_id" INTEGER NOT NULL,

    CONSTRAINT "ProyectoImagen_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ProyectoImagen" ADD CONSTRAINT "ProyectoImagen_proyecto_id_fkey" FOREIGN KEY ("proyecto_id") REFERENCES "Proyecto"("id") ON DELETE CASCADE ON UPDATE CASCADE;
