//--------------------------------------------------------------------------------------
// Scrolling Pixel Shader
//--------------------------------------------------------------------------------------
// Pixel shader that starts out drawing all pixels the same colour

#include "Common.hlsli" // Shaders can also use include files - note the extension


//--------------------------------------------------------------------------------------
// Textures
//--------------------------------------------------------------------------------------
// The later exercises will introduce textures although we will not look at them properly until later labs

Texture2D DiffuseMap : register(t0); // A diffuse map is the main texture for a model - the t0 indicates it
                                        // is in slot 0 (each shader can have only a fixed number of textures)
SamplerState Bilinear : register(s0); // A sampler is a filter for a texture like bilinear, trilinear or anisotropic
                                        // The s0 means use slot 0. There are a fixed number of slots for samplers.


//--------------------------------------------------------------------------------------
// Shader code
//--------------------------------------------------------------------------------------

// Pixel shader entry point - each shader has a "main" function
// Most basic pixel shader functionality to start with
float4 main(SimplePixelShaderInput input) : SV_Target
{
    input.uv.y += shift;

    float3 textureColour = DiffuseMap.Sample(Bilinear, input.uv); // This declares a local colour variable and samples
                                                                    // the texture at the location given by the
                                                                    // UVs using trilinear filtering (the filtering mode
                                                                    // is defined earlier)
    float4 colour;
    // colour = gCubeColour;
    // colour.rgb = input.colour;
    colour.rgb = textureColour;
    
    colour.r *= 0.3f;
    colour.g *= 0.7f;
    colour.b *= 0.2f;
   

    colour.a = 1.0f;
    return colour;
}