{{/*
Create a default fully qualified host name based on snapshot flag.
*/}}
{{- define "backend.hostname" -}}
{{- $prefix := default .Release.Name .Values.application.ingress.prefix }}
{{- if (and (.Values.application.snapshot) (.Values.application.ingress.domain)) }}
{{- printf "%s-snapshot-%s.%s" $prefix .Values.application.snapshot .Values.application.ingress.domain }}
{{- else }}
{{- printf "%s.%s" $prefix .Values.application.ingress.domain }}
{{- end }}
{{- end }}

{{/*
Constructs the IP whitelist annotation
*/}}
{{- define "backend.ipWhitelistAnnotation" -}}
    {{- if empty .Values.application.ingress.ipWhitelist -}}
        {{- printf "" -}}
    {{- else -}}
        {{- $ipsJoined := join ", " .Values.application.ingress.ipWhitelist }}
        {{- printf "nginx.ingress.kubernetes.io/whitelist-source-range: \"%s\"" $ipsJoined -}}
    {{- end -}}
{{- end -}}

{{/*
Constructs the istio excludeOutboundPorts annotation.
*/}}
{{- define "backend.istioExcludedOutboundPortsAnnotation" -}}
    {{- if empty .Values.istio.excludedOutboundPorts -}}
        {{- printf "" -}}
    {{- else -}}
        {{- $portsJoined := join ", " .Values.istio.excludedOutboundPorts }}
        {{- printf "traffic.sidecar.istio.io/excludeOutboundPorts: \"%s\"" $portsJoined -}}
    {{- end -}}
{{- end -}}

{{/*
Constructs the istio excludeOutboundIPRanges annotation.
*/}}
{{- define "backend.istioExcludeOutboundIPRangesAnnotation" -}}
    {{- if empty .Values.istio.excludeOutboundIPRanges -}}
        {{- printf "" -}}
    {{- else -}}
        {{- $ipsJoined := join ", " .Values.istio.excludeOutboundIPRanges }}
        {{- printf "traffic.sidecar.istio.io/excludeOutboundIPRanges: \"%s\"" $ipsJoined -}}
    {{- end -}}
{{- end -}}
