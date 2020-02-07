resource "aws_rds_cluster" "default" { 
    cluster_identifier      = "${var.cluster_identifier}" 
    engine                  = "${var.engine}" 
    engine_version          = "${var.engine_version}" 
    availability_zones      = ["${var.private_subnet_id_1}", "${var.private_subnet_id_2}", "${var.private_subnet_id_3}"]
    database_name           = "${var.database_name}" 
    port                    = "${var.port}"
    master_username         = "${var.master_username}" 
    master_password         = "${var.master_password}" 
    backup_retention_period = "${var.backup_retention_period}"
    skip_final_snapshot = true 
    preferred_backup_window = "07:00-09:00" 
  
  } 
