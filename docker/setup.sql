-- ./docker/setup.sql

CREATE EXTENSION IF NOT EXISTS vector; -- Garante que a extensão pgvector esteja ativada

CREATE TABLE IF NOT EXISTS audio_chunks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(), -- Usa UUIDs gerados pelo DB
    room_id TEXT NOT NULL, -- Altere para UUID se sua room_id for um UUID
    transcription TEXT,
    embeddings VECTOR(768), -- O tipo para embeddings, dimensão 768
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "rooms" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"description" text,
	"created_at" timestamp DEFAULT now() NOT NULL
);
CREATE TABLE IF NOT EXISTS "questions" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"room_id" uuid NOT NULL,
	"questions" text NOT NULL,
	"description" text,
	"answer" text,
	"created_at" timestamp DEFAULT now() NOT NULL
);