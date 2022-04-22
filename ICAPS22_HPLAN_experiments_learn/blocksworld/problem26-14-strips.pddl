( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b995 - block
    b519 - block
    b748 - block
    b114 - block
    b301 - block
    b645 - block
    b264 - block
    b411 - block
    b364 - block
    b331 - block
    b454 - block
    b356 - block
    b996 - block
    b743 - block
    b827 - block
    b359 - block
    b273 - block
    b413 - block
    b734 - block
    b85 - block
    b616 - block
    b521 - block
    b711 - block
    b460 - block
    b321 - block
    b905 - block
    b231 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b995 )
    ( on b519 b995 )
    ( on b748 b519 )
    ( on b114 b748 )
    ( on b301 b114 )
    ( on b645 b301 )
    ( on b264 b645 )
    ( on b411 b264 )
    ( on b364 b411 )
    ( on b331 b364 )
    ( on b454 b331 )
    ( on b356 b454 )
    ( on b996 b356 )
    ( on b743 b996 )
    ( on b827 b743 )
    ( on b359 b827 )
    ( on b273 b359 )
    ( on b413 b273 )
    ( on b734 b413 )
    ( on b85 b734 )
    ( on b616 b85 )
    ( on b521 b616 )
    ( on b711 b521 )
    ( on b460 b711 )
    ( on b321 b460 )
    ( on b905 b321 )
    ( on b231 b905 )
    ( clear b231 )
  )
  ( :goal
    ( and
      ( clear b995 )
    )
  )
)
