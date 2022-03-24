( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b403 - block
    b852 - block
    b887 - block
    b675 - block
    b714 - block
    b738 - block
    b378 - block
    b151 - block
    b225 - block
    b373 - block
    b515 - block
    b104 - block
    b866 - block
    b818 - block
    b411 - block
    b34 - block
    b674 - block
    b990 - block
    b972 - block
    b700 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b403 )
    ( on b852 b403 )
    ( on b887 b852 )
    ( on b675 b887 )
    ( on b714 b675 )
    ( on b738 b714 )
    ( on b378 b738 )
    ( on b151 b378 )
    ( on b225 b151 )
    ( on b373 b225 )
    ( on b515 b373 )
    ( on b104 b515 )
    ( on b866 b104 )
    ( on b818 b866 )
    ( on b411 b818 )
    ( on b34 b411 )
    ( on b674 b34 )
    ( on b990 b674 )
    ( on b972 b990 )
    ( on b700 b972 )
    ( clear b700 )
  )
  ( :goal
    ( and
      ( clear b403 )
    )
  )
)
