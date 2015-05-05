<?php
/* For licensing terms, see /license.txt */

namespace Chamilo\CoreBundle\Migrations\Schema\V110;

use Chamilo\CoreBundle\Migrations\AbstractMigrationChamilo;
use Doctrine\DBAL\Schema\Schema;

/**
 * Class Version20150505142900
 *
 * @package Chamilo\CoreBundle\Migrations\Schema\v1
 */
class Version20150505142900 extends AbstractMigrationChamilo
{
    /**
     * @param Schema $schema
     *
     * @throws \Doctrine\DBAL\Schema\SchemaException
     */
    public function up(Schema $schema)
    {
        // Create table for video chat
        $this->addSql("
            CREATE TABLE IF NOT EXISTS chat_video(
                id int unsigned not null auto_increment primary key,
                from_user int unsigned not null,
                to_user int unsigned not null,
                room_name varchar(255) not null,
                datetime datetime not null
            );
        ");
    }

    /**
     * We don't allow downgrades yet
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        $this->addSql("DROP TABLE IF EXISTS chat_video;");
    }
}
