# my_poker_kata

This is what I have leant from the class (OOP The Right Way)[https://classroom.skooldio.com/classroom/a13391bd-b8ad-4902-9235-2ed704d3af51].


## Poker Kata

.


## Setting Up a TypeScript Project with VS Code and Yarn

Follow these steps to set up a TypeScript project:

### 1. Project Setup
- **Create a Project Directory**: Open your terminal and use `mkdir` to create a new folder for your project (e.g., `my-ts-project`).
- **Navigate to the Project Directory**: Use `cd` to navigate into the newly created folder.
- **Initialize Yarn**: Run `yarn init` to create a `package.json` file.
- **Install TypeScript and Related Packages**:
    - Install TypeScript: `yarn add typescript --dev`.
    - *(Optional)* Install Node.js types: `yarn add @types/node --dev`.
    - *(Optional)* Install a TypeScript compiler like `ts-node`: `yarn add ts-node --dev`.

### 2. Configure TypeScript
- **Create a `tsconfig.json` File**: Run `tsc --init` to generate a `tsconfig.json` file in the project root.
- **Open the Project in VS Code**: Open the project folder in VS Code.

### 3. Write TypeScript Code
- **Create a TypeScript File**: Create a file with a `.ts` extension (e.g., `index.ts`).
- **Write Your Code**: Add your TypeScript code to the file.

### 4. Compile and Run
- **Compile TypeScript**: Open the terminal in VS Code and run `yarn tsc` to compile the TypeScript code into JavaScript.
- **Run the JavaScript Code**: Use `node <your-file>.js` to execute the compiled JavaScript file.
- *(Optional)* **Use `ts-node` for Debugging**: Run `yarn ts-node <your-file>.ts` to execute the TypeScript code directly without compiling.
