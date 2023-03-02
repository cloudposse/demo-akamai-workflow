variable "datastream_name" {
  type = string
}

resource "random_id" "property" {
  keepers = {
    # Generate a new id each time we switch to a new seed
    seed = "${module.this.id}-${var.datastream_name}"
  }
  byte_length = 16
}
