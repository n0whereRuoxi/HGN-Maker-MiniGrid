( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b972 - block
    b285 - block
    b687 - block
    b221 - block
    b889 - block
    b381 - block
    b181 - block
    b146 - block
    b428 - block
    b302 - block
    b395 - block
    b323 - block
    b781 - block
    b183 - block
    b192 - block
    b376 - block
    b830 - block
    b20 - block
    b482 - block
    b454 - block
    b654 - block
    b224 - block
    b167 - block
    b90 - block
    b941 - block
    b231 - block
    b664 - block
    b222 - block
    b187 - block
    b579 - block
    b136 - block
    b411 - block
    b715 - block
    b361 - block
    b680 - block
    b956 - block
    b894 - block
    b166 - block
    b644 - block
    b862 - block
    b289 - block
    b740 - block
    b778 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b972 )
    ( on b285 b972 )
    ( on b687 b285 )
    ( on b221 b687 )
    ( on b889 b221 )
    ( on b381 b889 )
    ( on b181 b381 )
    ( on b146 b181 )
    ( on b428 b146 )
    ( on b302 b428 )
    ( on b395 b302 )
    ( on b323 b395 )
    ( on b781 b323 )
    ( on b183 b781 )
    ( on b192 b183 )
    ( on b376 b192 )
    ( on b830 b376 )
    ( on b20 b830 )
    ( on b482 b20 )
    ( on b454 b482 )
    ( on b654 b454 )
    ( on b224 b654 )
    ( on b167 b224 )
    ( on b90 b167 )
    ( on b941 b90 )
    ( on b231 b941 )
    ( on b664 b231 )
    ( on b222 b664 )
    ( on b187 b222 )
    ( on b579 b187 )
    ( on b136 b579 )
    ( on b411 b136 )
    ( on b715 b411 )
    ( on b361 b715 )
    ( on b680 b361 )
    ( on b956 b680 )
    ( on b894 b956 )
    ( on b166 b894 )
    ( on b644 b166 )
    ( on b862 b644 )
    ( on b289 b862 )
    ( on b740 b289 )
    ( on b778 b740 )
    ( clear b778 )
  )
  ( :goal
    ( and
      ( clear b972 )
    )
  )
)
