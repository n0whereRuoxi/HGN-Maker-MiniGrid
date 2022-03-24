( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b992 - block
    b65 - block
    b158 - block
    b452 - block
    b832 - block
    b490 - block
    b229 - block
    b460 - block
    b400 - block
    b88 - block
    b900 - block
    b391 - block
    b426 - block
    b800 - block
    b541 - block
    b170 - block
    b181 - block
    b35 - block
    b957 - block
    b43 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b992 )
    ( on b65 b992 )
    ( on b158 b65 )
    ( on b452 b158 )
    ( on b832 b452 )
    ( on b490 b832 )
    ( on b229 b490 )
    ( on b460 b229 )
    ( on b400 b460 )
    ( on b88 b400 )
    ( on b900 b88 )
    ( on b391 b900 )
    ( on b426 b391 )
    ( on b800 b426 )
    ( on b541 b800 )
    ( on b170 b541 )
    ( on b181 b170 )
    ( on b35 b181 )
    ( on b957 b35 )
    ( on b43 b957 )
    ( clear b43 )
  )
  ( :goal
    ( and
      ( clear b992 )
    )
  )
)
