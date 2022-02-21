( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b440 - block
    b579 - block
    b513 - block
    b240 - block
    b969 - block
    b563 - block
    b222 - block
    b151 - block
    b501 - block
    b198 - block
    b336 - block
    b481 - block
    b973 - block
    b393 - block
    b68 - block
    b401 - block
    b673 - block
    b86 - block
    b763 - block
    b765 - block
    b835 - block
    b654 - block
    b231 - block
    b964 - block
    b298 - block
    b869 - block
    b534 - block
    b934 - block
    b462 - block
    b13 - block
    b238 - block
    b497 - block
    b69 - block
    b143 - block
    b516 - block
    b128 - block
    b316 - block
    b154 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b440 )
    ( on b579 b440 )
    ( on b513 b579 )
    ( on b240 b513 )
    ( on b969 b240 )
    ( on b563 b969 )
    ( on b222 b563 )
    ( on b151 b222 )
    ( on b501 b151 )
    ( on b198 b501 )
    ( on b336 b198 )
    ( on b481 b336 )
    ( on b973 b481 )
    ( on b393 b973 )
    ( on b68 b393 )
    ( on b401 b68 )
    ( on b673 b401 )
    ( on b86 b673 )
    ( on b763 b86 )
    ( on b765 b763 )
    ( on b835 b765 )
    ( on b654 b835 )
    ( on b231 b654 )
    ( on b964 b231 )
    ( on b298 b964 )
    ( on b869 b298 )
    ( on b534 b869 )
    ( on b934 b534 )
    ( on b462 b934 )
    ( on b13 b462 )
    ( on b238 b13 )
    ( on b497 b238 )
    ( on b69 b497 )
    ( on b143 b69 )
    ( on b516 b143 )
    ( on b128 b516 )
    ( on b316 b128 )
    ( on b154 b316 )
    ( clear b154 )
  )
  ( :goal
    ( and
      ( clear b440 )
    )
  )
)
