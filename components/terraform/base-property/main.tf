variable "property_name" {
  type = string
}

resource "random_id" "property" {
  keepers = {
    # Generate a new id each time we switch to a new seed
    seed = "${module.this.id}-${var.property_name}"
  }
  byte_length = 8
}
