// src/components/MyComponent.tsx
import React from 'react';

interface MyComponentProps {
  name: string;
}

const MyComponent: React.FC<MyComponentProps> = ({ name }) => {
  return (
    <div>
      <h1>สวัสดี {name}!</h1>
      <p>นี่คือคอมโพเนนต์ TypeScript.</p>
    </div>
  );
};

export default MyComponent;