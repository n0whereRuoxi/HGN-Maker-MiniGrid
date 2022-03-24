( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b660 - block
    b299 - block
    b506 - block
    b703 - block
    b867 - block
    b757 - block
    b492 - block
    b27 - block
    b120 - block
    b77 - block
    b641 - block
    b298 - block
    b915 - block
    b954 - block
    b805 - block
    b249 - block
    b754 - block
    b411 - block
    b969 - block
    b670 - block
    b775 - block
    b882 - block
    b41 - block
    b35 - block
    b937 - block
    b995 - block
    b813 - block
    b690 - block
    b304 - block
    b335 - block
    b487 - block
    b21 - block
    b363 - block
    b433 - block
    b721 - block
    b480 - block
    b280 - block
    b239 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b660 )
    ( on b299 b660 )
    ( on b506 b299 )
    ( on b703 b506 )
    ( on b867 b703 )
    ( on b757 b867 )
    ( on b492 b757 )
    ( on b27 b492 )
    ( on b120 b27 )
    ( on b77 b120 )
    ( on b641 b77 )
    ( on b298 b641 )
    ( on b915 b298 )
    ( on b954 b915 )
    ( on b805 b954 )
    ( on b249 b805 )
    ( on b754 b249 )
    ( on b411 b754 )
    ( on b969 b411 )
    ( on b670 b969 )
    ( on b775 b670 )
    ( on b882 b775 )
    ( on b41 b882 )
    ( on b35 b41 )
    ( on b937 b35 )
    ( on b995 b937 )
    ( on b813 b995 )
    ( on b690 b813 )
    ( on b304 b690 )
    ( on b335 b304 )
    ( on b487 b335 )
    ( on b21 b487 )
    ( on b363 b21 )
    ( on b433 b363 )
    ( on b721 b433 )
    ( on b480 b721 )
    ( on b280 b480 )
    ( on b239 b280 )
    ( clear b239 )
  )
  ( :goal
    ( and
      ( clear b660 )
    )
  )
)
