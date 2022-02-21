( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b624 - block
    b185 - block
    b877 - block
    b949 - block
    b629 - block
    b98 - block
    b324 - block
    b290 - block
    b231 - block
    b334 - block
    b492 - block
    b270 - block
    b193 - block
    b686 - block
    b520 - block
    b153 - block
    b930 - block
    b764 - block
    b303 - block
    b360 - block
    b622 - block
    b465 - block
    b633 - block
    b247 - block
    b895 - block
    b807 - block
    b322 - block
    b377 - block
    b903 - block
    b744 - block
    b353 - block
    b638 - block
    b667 - block
    b711 - block
    b742 - block
    b540 - block
    b416 - block
    b792 - block
    b224 - block
    b167 - block
    b532 - block
    b56 - block
    b909 - block
    b331 - block
    b257 - block
    b906 - block
    b639 - block
    b758 - block
    b863 - block
    b107 - block
    b124 - block
    b885 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b624 )
    ( on b185 b624 )
    ( on b877 b185 )
    ( on b949 b877 )
    ( on b629 b949 )
    ( on b98 b629 )
    ( on b324 b98 )
    ( on b290 b324 )
    ( on b231 b290 )
    ( on b334 b231 )
    ( on b492 b334 )
    ( on b270 b492 )
    ( on b193 b270 )
    ( on b686 b193 )
    ( on b520 b686 )
    ( on b153 b520 )
    ( on b930 b153 )
    ( on b764 b930 )
    ( on b303 b764 )
    ( on b360 b303 )
    ( on b622 b360 )
    ( on b465 b622 )
    ( on b633 b465 )
    ( on b247 b633 )
    ( on b895 b247 )
    ( on b807 b895 )
    ( on b322 b807 )
    ( on b377 b322 )
    ( on b903 b377 )
    ( on b744 b903 )
    ( on b353 b744 )
    ( on b638 b353 )
    ( on b667 b638 )
    ( on b711 b667 )
    ( on b742 b711 )
    ( on b540 b742 )
    ( on b416 b540 )
    ( on b792 b416 )
    ( on b224 b792 )
    ( on b167 b224 )
    ( on b532 b167 )
    ( on b56 b532 )
    ( on b909 b56 )
    ( on b331 b909 )
    ( on b257 b331 )
    ( on b906 b257 )
    ( on b639 b906 )
    ( on b758 b639 )
    ( on b863 b758 )
    ( on b107 b863 )
    ( on b124 b107 )
    ( on b885 b124 )
    ( clear b885 )
  )
  ( :goal
    ( and
      ( clear b624 )
    )
  )
)
