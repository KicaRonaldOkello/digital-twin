variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, prod."
  }
}

variable "openrouter_api_key" {
  description = "OpenRouter API key for the Lambda backend. Prefer TF_VAR_openrouter_api_key or GitHub secret OPENROUTER_API_KEY in CI."
  type        = string
  sensitive   = true
}

variable "openrouter_model" {
  description = "OpenRouter model id (see https://openrouter.ai/models)"
  type        = string
  default     = "openai/gpt-4o-mini"
}

variable "openrouter_http_referer" {
  description = "Optional site URL sent as HTTP-Referer for OpenRouter rankings"
  type        = string
  default     = ""
}

variable "openrouter_app_title" {
  description = "Optional app name sent as X-Title for OpenRouter rankings"
  type        = string
  default     = ""
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 60
}

variable "api_throttle_burst_limit" {
  description = "API Gateway throttle burst limit"
  type        = number
  default     = 10
}

variable "api_throttle_rate_limit" {
  description = "API Gateway throttle rate limit"
  type        = number
  default     = 5
}

variable "use_custom_domain" {
  description = "Attach a custom domain to CloudFront"
  type        = bool
  default     = false
}

variable "root_domain" {
  description = "Apex domain name, e.g. mydomain.com"
  type        = string
  default     = ""
}
