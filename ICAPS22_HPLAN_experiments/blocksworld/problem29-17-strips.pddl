( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b787 - block
    b758 - block
    b403 - block
    b115 - block
    b915 - block
    b460 - block
    b977 - block
    b172 - block
    b863 - block
    b979 - block
    b388 - block
    b940 - block
    b124 - block
    b366 - block
    b295 - block
    b567 - block
    b885 - block
    b419 - block
    b500 - block
    b138 - block
    b819 - block
    b4 - block
    b744 - block
    b248 - block
    b798 - block
    b561 - block
    b976 - block
    b704 - block
    b343 - block
    b64 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b787 )
    ( on b758 b787 )
    ( on b403 b758 )
    ( on b115 b403 )
    ( on b915 b115 )
    ( on b460 b915 )
    ( on b977 b460 )
    ( on b172 b977 )
    ( on b863 b172 )
    ( on b979 b863 )
    ( on b388 b979 )
    ( on b940 b388 )
    ( on b124 b940 )
    ( on b366 b124 )
    ( on b295 b366 )
    ( on b567 b295 )
    ( on b885 b567 )
    ( on b419 b885 )
    ( on b500 b419 )
    ( on b138 b500 )
    ( on b819 b138 )
    ( on b4 b819 )
    ( on b744 b4 )
    ( on b248 b744 )
    ( on b798 b248 )
    ( on b561 b798 )
    ( on b976 b561 )
    ( on b704 b976 )
    ( on b343 b704 )
    ( on b64 b343 )
    ( clear b64 )
  )
  ( :goal
    ( and
      ( clear b787 )
    )
  )
)
