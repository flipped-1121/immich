import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('ocr')
export class OcrEntity {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @Column({ type: 'uuid' })
  assetId!: string;

  @Column({ type: 'varchar', nullable: true, default: null })
  text?: string | null;
}
