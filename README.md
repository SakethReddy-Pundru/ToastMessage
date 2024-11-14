## Toast Notification System

### Overview
A lightweight, customizable toast notification system for SwiftUI apps. It provides visually distinct notifications for events like errors, warnings, successes, and info messages. The system is easy to integrate, with options for auto-dismiss and manual cancellation.

### Components

1. **Toast Struct**  
   Defines the properties of a toast, including `type`, `title`, `message`, and `duration`.

2. **ToastStyle Enum**  
   Defines toast styles (`error`, `warning`, `success`, `info`) with unique colors and icons for each type.

3. **ToastView**  
   A SwiftUI view that displays a toast with an icon, title, message, and cancel button. Each toast style has a distinct color and icon.

4. **ToastModifier**  
   A view modifier that overlays the toast onto any view, adds animations, and manages auto-dismissal.

### Usage
Easily display a toast notification with custom styling and automatic removal, ideal for temporary messages in any SwiftUI app.
