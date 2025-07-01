.PHONY: localstack-up localstack-down localstack-logs test-local

# Start LocalStack
localstack-up:
	docker-compose up -d
	@echo "Waiting for LocalStack to be ready..."
	@timeout 60 bash -c 'until curl -s http://localhost:4566/_localstack/health > /dev/null; do echo "Waiting..."; sleep 2; done'
	@echo "LocalStack is ready!"

# Stop LocalStack
localstack-down:
	docker-compose down

# Show LocalStack logs
localstack-logs:
	docker-compose logs -f localstack

# Test local environment
test-local: localstack-up
	cd environments/local && terraform init
	cd environments/local && terraform plan
	cd environments/local && terraform apply -auto-approve
	@echo "Local test completed!"

# Clean local environment
clean-local:
	cd environments/local && terraform destroy -auto-approve || true
	$(MAKE) localstack-down