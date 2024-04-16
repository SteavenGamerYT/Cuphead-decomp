Shader "Cuphead/Sprites/IceCubes" {
	Properties {
		_MainTex ("MainTex", 2D) = "white" {}
		_Amount ("Amount", Range(0, 10)) = 5
		_CutoffMax ("Alpha cutoff max", Range(0, 1)) = 0.867
		_CutoffMin ("Alpha cutoff min", Range(0, 1)) = 0.2
		_CutoffGreen ("Green cutoff", Range(0, 1)) = 0.1
		_CutoffBlue ("Blue cutoff", Range(0, 1)) = 0.1
		_BlendValue ("Blend value", Range(0, 1)) = 0.5
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	Fallback "Diffuse"
	//CustomEditor "ShaderForgeMaterialInspector"
}