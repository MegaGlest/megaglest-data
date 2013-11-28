!!ARBfp1.0
# bumpd.fp -- David HENRY
# Bump mapping with only Diffuse component

TEMP tmp, normal, diffuse, specular;

PARAM diffuseColor = state.light[0].diffuse;
PARAM ambientColor = state.light[0].ambient;

ATTRIB iTexCoords = fragment.texcoord[0];
ATTRIB iHalfVec = fragment.texcoord[2];
ATTRIB iLightVec = fragment.texcoord[3];

OUTPUT oColor = result.color;

# Fetch normal from normal map, expand to the [-1, 1] range, and normalize
# > vec3 normal = 2.0 * texture2D (normalMap, gl_TexCoord[0].st).rgb - 1.0;
# > normal = normalize (normal);
TEX  normal, iTexCoords, texture[2], 2D;    # normal = texture2D (normalMap, gl_TexCoord[0].st).rgb
MAD  normal, normal, 2.0, -1.0;             # normal = 2.0 * normal - 1.0

DP3  normal.w, normal, normal;
RSQ  normal.w, normal.w;
MUL  normal.xyz, normal.w, normal;          # normalize (normal)

# Compute diffuse lighting
# > vec3 diffuse = max (dot (iLightVec, normal), 0.0) * vec3 (gl_LightSource[0].diffuse);
# > diffuse = diffuse * texture2D (decalMap, iTexCoords).rgb;
DP3  tmp, iLightVec, normal;                # tmp = dot (iLightVec, normal)
MAX  tmp, tmp, 0.0;                         # tmp = max (dot (iLightVec, normal), 0.0)
MUL  diffuse, tmp, diffuseColor;            # diffuse = tmp * gl_LightSource[0].diffuse
TEX  tmp, iTexCoords, texture[0], 2D;       # tmp = texture2D (decalMap, iTexCoords).rgb
MUL  diffuse, diffuse, tmp;                 # diffuse = diffuse * tmp

# Output final color
# > gl_FragColor = vec4 (diffuse, 1.0) + gl_LightSource[0].ambient;
ADD  oColor, diffuse, ambientColor;         # oColor = diffuse + ambiant

END
