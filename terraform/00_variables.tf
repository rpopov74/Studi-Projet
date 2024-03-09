variable "network_external_id" {
  type    = string
  default = "0f9c3806-bd21-490f-918d-4a6d1c648489"
}

variable "network_external_name" {
  type    = string
  default = "ext-floating1"
}

variable "network_internal_dev" {
  type    = string
  default = "internal_dev"
}

variable "network_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "ssh_public_key_default_user" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDlTaGiCtYO+dR2rG4H5p0WS1WZoipXfxfzb24rJTHr/mE6vB44YwdQ2VQKnJE7U8SoZEcr4DAt5MgHpzpmQqfKu2YM5j+QAVwhp0k7k1U6K7Fg2ZoDa1txCfRLipHHHCKPqaLGmUcfi+fOGUtbBSUSdUXMEDr/DNdO/oEN2UOLHtEqXr4jTw5jU26B1VuLhkoCHgwHFuo0/kF4FZGLepPAC5amTkqYBygikWi52jMjhIr93KuW4Z+1k8SZ6ErQK9EXqSYhsv7Fd0X99kgtxOc3S9CMgVG4hI0wFe5YeSC33ILPsANOe10u3l8Nf2P7lINpuLbiml2+9GnBF+8YNyW7 rsa-key-20240305"
}

variable "ssh_public_key_popov" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDXgf9FEyXJPW3qXCeBdvtQMb7k5bgcedG/3Ra93YycBKt3peUV1oGvTs78oRlzPcJZfaYaQj75J3XlrGMPYR++qSWM2ZKIuteg8s+eMir5DX/LJ2JGg25dwm4uOrsjjLPjp3OCh9V9N0KVs7dz4YsB3s8TkUjT6wqkFcxmd5ViWP6qvVPsuGJ2gxBjqs0SD/E49UWiTbYY6MRT+2naQJTFf6XEY52KtjTIoRwY+VaQPrxANzgPDjDQqu+otONc6Q68H8oeZ1vwgx6eLCWaX6kNqPfUQjKmTrYyBBBhiwO/5h42CfgOGOJQzxJslw8MT4PwdIXti4XyzFXv4wLxnp72Hf7rU7nOFs7oakXqzsCJfaWScCuP4NFEaSTkhockJ6eV3jgutG5jnkhJEFV5E9XfAOTlxzTzIGlSvVfxuowgPD/ifzLh/8OKe4QktNN3He9+p9F4OtmKef+/pshw5FLs1d8sWRjakONid9k+KBnLEXAlK8j70pZVm4g9IP0RhKE= popov@popov-ZenBook-UX425JA-UX425JA"
}

variable "instance_image_id" {
  type    = string
  default = "cdf81c97-4873-473b-b0a3-f407ce837255"
}

variable "instance_flavor_name" {
  type    = string
  default = "a1-ram2-disk20-perf1"
}

variable "instance_security_groups" {
  type    = list(any)
  default = ["default"]
}

variable "metadatas" {
  type = map(string)
  default = {
    "environment" = "dev"
  }
}
