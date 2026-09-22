# advanced-cicd-devops-
# Advanced CI/CD & Deployment Strategies

This project demonstrates an automated CI/CD pipeline using GitHub, Jenkins and Docker.

## Technologies

- GitHub
- Jenkins
- Docker
- Docker Hub
- Bash
- Nginx

## Pipeline Stages

1. Checkout
2. Build
3. Test
4. Package
5. Docker Build
6. Docker Push
7. Deployment
8. Verification

## Deployment Strategies

### Blue-Green Deployment

Blue-Green deployment uses two environments:

- Blue - Current production version
- Green - New application version

Traffic can be switched from Blue to Green after successful verification.

### Rolling Deployment

Rolling deployment gradually replaces old application instances with the new version.

This reduces downtime and allows gradual deployment.

### Rollback Strategy

If the new version fails after deployment, the previous working version can be restored.

## Environment Variables

The Jenkins pipeline uses environment variables for:

- Application name
- Docker image name
- Docker image tag

## Automated Testing

The `tests/test.sh` script verifies that the application file exists and contains the expected application content.

## Objective

The objective of this project is to understand how code moves from GitHub through Jenkins CI/CD stages to a Docker container registry and deployment.
