# 🎥 video-pro-stream

**Système complet d'enregistrement et de montage vidéo 100% Dockerisé**, conçu pour les développeurs qui veulent documenter leur travail sans friction.

---

## 📦 Objectifs

- Capturer deux écrans + webcam via OBS (conteneur sur Mac)
- Stockage direct sur NAS via montage SMB/NFS
- Conversion `.mkv` → `.mp4` automatisée
- Montage distant GPU via HTPC avec Xpra + Kdenlive/Shotcut
- Accès au montage via interface HTML5 (navigateur)

---

## ⚙️ Architecture

```mermaid
flowchart LR
    subgraph MacBook["MacBook Air" - 2560×1600]
        OBS[OBS Studio - Docker]
        CAM[Webcam Intégrée]
        DISP1[Écran Principal]
        HTML5["🖥️ Xpra HTML5 UI"]
        DISP2[Écran Secondaire - Asus 15.4 1080p]
        OBS -->|Capture| DISP1
        OBS -->|Capture| DISP2
        OBS -->|FaceCam| CAM
        OBS --> NAS1[NAS /Volumes/video_SMB]
    end

    subgraph NAS["Synology NAS"]
        NAS2
        NAS2[/volume1/video/]
    end

    subgraph HTPC["HTPC Dev (GPU)"]
        XPRA[Xpra + Xorg - Docker]
        MONTAGE[Kdenlive / Shotcut / ffmpeg - Docker]
        NAS2 -->|Mount NFS| XPRA
        NAS2 -->|Mount NFS| OBS
        XPRA --> MONTAGE
        HTML5 --> XPRA
        MONTAGE -->|Output MP4| NAS2
    end
```

🔗 [Voir le diagramme interactif](https://vegito-app.github.io/video-pro-stream/)

---

## 🚀 Composants

- `docker-compose.obs.yml` → OBS avec 2 écrans + webcam
- `convert.sh` → conversion `.mkv` vers `.mp4`
- `docker-compose.htpc.yml` → conteneur GPU avec montage HTML5
- `start-xpra.sh` → session Xpra autonome avec Kdenlive

---

## 🔗 Liens utiles

- 🧠 GitHub Pages : [vegito-app.github.io/video-pro-stream](https://vegito-app.github.io/video-pro-stream/)
- 📦 Dépôt principal : [`vegito-app/video-pro-stream`](https://github.com/vegito-app/video-pro-stream)

---

## 🛠️ Licence

MIT — Reprenez le contrôle sur votre flux de travail créatif.
