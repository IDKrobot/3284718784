"use strict";
class Vector {
    /**
     * @param x X-axis
     * @param y Y-axis
     * @param z Z-axis
     */
    constructor(x = 0, y = 0, z = 0) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
    /**
     * Overloaded +. Adds vectors together.
     */
    __add(b) {
        if (this.isArrayVector(b))
            b = Vector.toVector(b);
        return new Vector(this.x + b.x, this.y + b.y, this.z + b.z);
    }
    /**
     * Overloaded -. Subtracts vectors.
     */
    __sub(b) {
        if (this.isArrayVector(b))
            b = Vector.toVector(b);
        return new Vector(this.x - b.x, this.y - b.y, this.z - b.z);
    }
    /**
     * Overloaded * returns the vectors multiplied together. Can also be used to
     * multiply with scalars.
     *
     * @both
     */
    __mul(b) {
        if (typeof b === "number")
            return new Vector(this.x * b, this.y * b, this.z * b);
        if (this.isArrayVector(b))
            b = Vector.toVector(b);
        return new Vector(this.x * b.x, this.y * b.y, this.z * b.z);
    }
    /**
     * Overloaded /. Divides vectors.
     */
    __div(b) {
        if (typeof b === "number")
            return new Vector(this.x / b, this.y / b, this.z / b);
        if (this.isArrayVector(b))
            b = Vector.toVector(b);
        return new Vector(this.x / b.x, this.y / b.y, this.z / b.z);
    }
    /**
     * Overloaded ==. Tests for Equality.
     */
    __eq(b) {
        if (this.isArrayVector(b))
            b = Vector.toVector(b);
        return (this.x === b.x && this.y === b.y && this.z === b.z);
    }
    /**
     * Overloaded `Length` returns the length of the vector.
     */
    __len() {
        return this.Length();
    }
    /**
     * Overloaded - operator. Reverses the vector.
     */
    __unm() {
        return new Vector(-this.x, -this.y, -this.z);
    }
    /**
     * Cross product of two vectors.
     */
    Cross(b) {
        if (this.isArrayVector(b))
            b = Vector.toVector(b);
        const [ax, ay, az] = this.toArray();
        const [bx, by, bz] = b.toArray();
        const cx = ax * bx - az * by;
        const cy = az * bx - ax * bz;
        const cz = ax * by - ay * bx;
        return new Vector(cx, cy, cz);
    }
    /**
     * Dot product of two vectors.
     */
    Dot(b) {
        if (this.isArrayVector(b))
            b = Vector.toVector(b);
        const [ax, ay, az] = this.toArray();
        const [bx, by, bz] = b.toArray();
        return ax * bx + ay * by + az + bz;
    }
    /**
     * Overloaded `Length` returns the length of the vector.
     */
    length() {
        return this.Length();
    }
    /**
     * Length of the Vector.
     */
    Length() {
        return Math.sqrt(this.x ** 2 + this.y ** 2 + this.z ** 2);
    }
    /**
     * Length of the Vector in the XY plane.
     */
    Length2D() {
        return Math.sqrt(this.x ** 2 + this.y ** 2);
    }
    /**
     * Returns the vector normalized.
     */
    Normalized() {
        const vector = this.clone();
        return vector.__div(vector.Length());
    }
    /**
     * Linearly interpolates between two vectors.
     *
     * This is most commonly used to find a point some fraction of the way along a
     * line between two endpoints.
     *
     * Same as `this + (b - this) * t`.
     *
     * @param t Interpolant
     */
    Lerp(b, t) {
        if (this.isArrayVector(b))
            b = Vector.toVector(b);
        const vector = this.clone();
        return vector.__add(b.__sub(vector).__mul(t));
    }
    /**
     * Returns a string representation of a vector.
     */
    toString() {
        return `Vector(${this.x}, ${this.y}, ${this.z})`;
    }
    /**
     * Convert vector to 3-length array.
     */
    toArray() {
        return [this.x, this.y, this.z];
    }
    /**
     * Convert array to vector.
     */
    static toVector(arr) {
        if (arr instanceof Vector)
            return arr.clone();
        arr = arr !== null && arr !== void 0 ? arr : [0, 0, 0];
        return new Vector(...arr);
    }
    /**
     * Clamps a vector to a radius.
     */
    Clamp(b, radius) {
        if (this.isArrayVector(b))
            b = Vector.toVector(b);
        const vector = this.clone();
        const length = vector.__sub(b).Length2D();
        if (length < radius)
            return vector;
        const unitVector = vector.__div(length);
        return b.__add(unitVector.__mul(radius));
    }
    clone() {
        return new Vector(this.x, this.y, this.z);
    }
    isArrayVector(arr) {
        return (Array.isArray(arr)
            && arr.length === 3
            && typeof arr[0] === "number"
            && typeof arr[1] === "number"
            && typeof arr[2] === "number");
    }
}
