( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b512 - block
    b80 - block
    b911 - block
    b169 - block
    b182 - block
    b620 - block
    b926 - block
    b894 - block
    b888 - block
    b77 - block
    b576 - block
    b999 - block
    b902 - block
    b670 - block
    b301 - block
    b78 - block
    b85 - block
    b254 - block
    b577 - block
    b266 - block
    b887 - block
    b465 - block
    b995 - block
    b523 - block
    b428 - block
    b866 - block
    b380 - block
    b980 - block
    b389 - block
    b881 - block
    b904 - block
    b401 - block
    b762 - block
    b836 - block
    b535 - block
    b933 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b512 )
    ( on b80 b512 )
    ( on b911 b80 )
    ( on b169 b911 )
    ( on b182 b169 )
    ( on b620 b182 )
    ( on b926 b620 )
    ( on b894 b926 )
    ( on b888 b894 )
    ( on b77 b888 )
    ( on b576 b77 )
    ( on b999 b576 )
    ( on b902 b999 )
    ( on b670 b902 )
    ( on b301 b670 )
    ( on b78 b301 )
    ( on b85 b78 )
    ( on b254 b85 )
    ( on b577 b254 )
    ( on b266 b577 )
    ( on b887 b266 )
    ( on b465 b887 )
    ( on b995 b465 )
    ( on b523 b995 )
    ( on b428 b523 )
    ( on b866 b428 )
    ( on b380 b866 )
    ( on b980 b380 )
    ( on b389 b980 )
    ( on b881 b389 )
    ( on b904 b881 )
    ( on b401 b904 )
    ( on b762 b401 )
    ( on b836 b762 )
    ( on b535 b836 )
    ( on b933 b535 )
    ( clear b933 )
  )
  ( :goal
    ( and
      ( clear b512 )
    )
  )
)
