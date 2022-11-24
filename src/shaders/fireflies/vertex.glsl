uniform float uTime;
uniform float uPixelRatio;
uniform float uSize;

attribute float aScale;

void main()
{
	vec4 modelPosition = modelMatrix * vec4(position, 1.0);
	modelPosition.y /= sin(sin(sin(uTime + modelPosition.x * 0.01) * aScale * 0.2 * modelPosition.x ))* 1.0;
	modelPosition.x *= cos((cos(cos(uTime)* 10.0 * 4.0 * sin(0.1 * sin(uTime * 2.0)* cos(uTime * 0.2)* sin(uTime * 0.5))* sin(uTime * 2.0)) * 0.5));
	modelPosition.z *= cos((cos(uTime)* 10.0 * 4.0 * 0.1 * sin(uTime * 2.0)* cos(uTime * 0.2)* cos(uTime * 0.5)* sin(uTime * 2.0)) * 0.5);
	// modelPosition.z *= sin(uTime)* 10.0 * 4.0 * 0.1;
	// modelPosition.z += sin(uTime) * 2.0 * modelPosition.x;


    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;

    gl_Position = projectionPosition;
    
    gl_PointSize = uSize * aScale * uPixelRatio;
    gl_PointSize *= (1.0 / - viewPosition.z);
}