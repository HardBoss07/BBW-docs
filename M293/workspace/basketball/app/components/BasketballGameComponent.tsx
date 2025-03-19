import PlayerComponent from "@/app/components/PlayerComponent";

export default function BasketballGameComponent() {
    return (
        <div className="grid">
            <PlayerComponent title="Home"/>
            <PlayerComponent title="Guest"/>
        </div>
    );
}