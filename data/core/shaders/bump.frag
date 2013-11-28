uniform bool parallaxMapping;

uniform sampler2D decalMap;
uniform sampler2D glossMap;
uniform sampler2D normalMap;
uniform sampler2D heightMap;

varying vec3 lightVec;
varying vec3 halfVec;
varying vec3 eyeVec;


// -------------------------------------------------------
// Fragment shader's main entry point.
//
// Bump mapping with parallax offset.  I take inspiration
// from nVidia's bump mapping demo for this program.
// -------------------------------------------------------

void main (void)
{
  vec2 texCoords;

  if (parallaxMapping)
    {
      // use parallax mapping
      float height = texture2D (heightMap, gl_TexCoord[0].st).r;
      height = height * 0.04 - 0.02;

      vec3 eye = normalize (eyeVec);
      texCoords = (height * eye.xy) + gl_TexCoord[0].st;
    }
  else
    {
      // standard bump mapping
      texCoords = gl_TexCoord[0].st;
    }

  // fetch normal from normal map, expand to the [-1, 1] range, and normalize
  vec3 normal = 2.0 * texture2D (normalMap, gl_TexCoord[0].st).rgb - 1.0;
  normal = normalize (normal);

  // compute diffuse lighting
  vec3 diffuse = max (dot (lightVec, normal), 0.0) * vec3 (gl_LightSource[0].diffuse);
  vec3 decalColor = texture2D (decalMap, texCoords).rgb;

  // compute specular lighting
  vec3 specularCoeff = texture2D (glossMap, texCoords).rgb;
  float specular = max (dot (halfVec, normal), 0.0);
  specular = pow (specular, 8.0);

  // output final color
  gl_FragColor = vec4 (diffuse * decalColor + vec3 (specular) * specularCoeff, 1.0)
               + gl_LightSource[0].ambient;
}
