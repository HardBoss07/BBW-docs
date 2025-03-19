import {read} from "node:fs";

interface InputComponentProps {
    title: string;
    placeholder: string;
    value: string | number;
    readonly : boolean;
    onChange: (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => void;
}

export default function InputComponent({title, placeholder, value, readonly, onChange}: InputComponentProps) {
    return (
        <>
            <h2 className="text-2xl">{title}</h2>
            <input
                value={value}
                onChange={onChange}
                placeholder={placeholder}
                readOnly={readonly}
            />
        </>
    );
}