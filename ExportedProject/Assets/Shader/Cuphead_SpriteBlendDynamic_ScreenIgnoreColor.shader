Shader "Cuphead/SpriteBlendDynamic/ScreenIgnoreColor" {
	Properties {
		_MainTex ("Main Tex", 2D) = "white" {}
		_Amount ("Amount", Range(0, 1)) = 0.5
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
		_ReferenceColor1 ("Reference Color 1", Vector) = (1,1,1,1)
		_Threshold ("Recolor Threshold 1", Range(0.9, 1.01)) = 1
		_ReferenceColor2 ("Reference Color 2", Vector) = (1,1,1,1)
		_Threshold2 ("Recolor Threshold 2", Range(0.9, 1.01)) = 1
		_ReferenceColor3 ("Reference Color 3", Vector) = (1,1,1,1)
		_Threshold3 ("Recolor Threshold 3", Range(0.9, 1.01)) = 1
		[Toggle] _IncludeBlacks ("Include Blacks", Float) = 0
		_BlackThreshold ("Black Threshold", Range(0, 1)) = 0
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