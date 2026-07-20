import React, { 
  useState, 
  useEffect, 
  useContext, 
  useReducer, 
  useCallback, 
  useMemo, 
  useRef, 
  Suspense, 
  lazy 
} from 'react';
import ReactDOM from 'react-dom/client';

// Context
const ThemeContext = React.createContext();

// Lazy component
const LazyComponent = lazy(() => import('./LazyComponent'));

// Reducer
function counterReducer(state, action) {
  switch (action.type) {
    case 'increment': return { count: state.count + 1 };
    case 'decrement': return { count: state.count - 1 };
    case 'reset': return { count: 0 };
    default: return state;
  }
}

// Custom Hook
function useLocalStorage(key, initialValue) {
  const [value, setValue] = useState(() => {
    const saved = localStorage.getItem(key);
    return saved !== null ? JSON.parse(saved) : initialValue;
  });

  useEffect(() => {
    localStorage.setItem(key, JSON.stringify(value));
  }, [key, value]);

  return [value, setValue];
}

// Componente Principal
function App() {
  // Hooks
  const [count, setCount] = useState(0);
  const [name, setName] = useState("João");
  const [theme, setTheme] = useContext(ThemeContext);
  const [state, dispatch] = useReducer(counterReducer, { count: 0 });
  
  const inputRef = useRef(null);
  const [storedValue, setStoredValue] = useLocalStorage("app-value", 42);

  // useEffect
  useEffect(() => {
    document.title = `Contagem: ${count}`;
    console.log("Componente montado ou count mudou");
    
    return () => console.log("Cleanup");
  }, [count]);

  // useCallback
  const handleClick = useCallback(() => {
    setCount(c => c + 1);
    dispatch({ type: 'increment' });
  }, []);

  // useMemo
  const expensiveValue = useMemo(() => {
    console.log("Calculando valor caro...");
    return Array.from({ length: 1000 }, (_, i) => i * count).reduce((a, b) => a + b, 0);
  }, [count]);

  // Event Handlers
  const handleInputChange = (e) => setName(e.target.value);
  const focusInput = () => inputRef.current?.focus();

  // Render
  return React.createElement('div', {
    className: `app ${theme}`,
    style: { padding: '20px', fontFamily: 'Arial' }
  },
    React.createElement('h1', null, 'Exemplo Completo JSX / React ⚛️'),
    
    React.createElement('p', null, `Olá, ${name}!`),
    
    // Contadores
    React.createElement('div', null,
      React.createElement('p', null, `Contador useState: ${count}`),
      React.createElement('p', null, `Contador useReducer: ${state.count}`),
      React.createElement('p', null, `Valor localStorage: ${storedValue}`),
      React.createElement('p', null, `Valor memoizado: ${expensiveValue}`)
    ),

    // Botões
    React.createElement('div', { style: { margin: '15px 0' } },
      React.createElement('button', { onClick: handleClick }, '+ Incrementar'),
      React.createElement('button', { onClick: () => setCount(0) }, 'Reset'),
      React.createElement('button', { onClick: focusInput }, 'Focar Input')
    ),

    // Formulário
    React.createElement('input', {
      ref: inputRef,
      type: "text",
      value: name,
      onChange: handleInputChange,
      placeholder: "Digite seu nome"
    }),

    // Lista com map
    React.createElement('ul', null,
      [1, 2, 3, 4, 5].map(n => 
        React.createElement('li', { key: n }, `Item ${n} × ${count}`)
      )
    ),

    // Ternário e condicional
    count > 5 
      ? React.createElement('h3', { style: { color: 'green' } }, 'Muito alto!')
      : React.createElement('h3', null, 'Ainda controlado'),

    // Fragment
    React.createElement(React.Fragment, null,
      React.createElement('p', null, 'Este é um Fragment'),
      React.createElement('p', null, `Tema atual: ${theme}`)
    ),

    // Botão de tema
    React.createElement('button', {
      onClick: () => setTheme(theme === 'light' ? 'dark' : 'light')
    }, 'Alternar Tema'),

    // Suspense + Lazy
    React.createElement(Suspense, {
      fallback: React.createElement('div', null, 'Carregando componente preguiçoso...')
    },
      React.createElement(LazyComponent, { count })
    )
  );
}

// Provider
function ThemeProvider({ children }) {
  const [theme, setTheme] = useState('light');
  
  return React.createElement(ThemeContext.Provider, {
    value: [theme, setTheme]
  }, children);
}

// Renderização
const root = ReactDOM.createRoot(document.getElementById('root'));

root.render(
  React.createElement(React.StrictMode, null,
    React.createElement(ThemeProvider, null,
      React.createElement(App)
    )
  )
);

export default App;