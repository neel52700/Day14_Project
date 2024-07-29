# Use the OpenJDK image with JDK installed
FROM openjdk:11-slim

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . /app

# Compile the Java application
RUN javac Sample.java

# Run the Java application
CMD ["java", "Sample"]
