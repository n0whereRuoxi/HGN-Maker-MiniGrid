( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b110 - block
    b284 - block
    b263 - block
    b440 - block
    b186 - block
    b326 - block
    b692 - block
    b117 - block
    b485 - block
    b616 - block
    b482 - block
    b355 - block
    b373 - block
    b80 - block
    b586 - block
    b146 - block
    b761 - block
    b405 - block
    b706 - block
    b515 - block
    b976 - block
    b906 - block
    b914 - block
    b488 - block
    b379 - block
    b837 - block
    b892 - block
    b854 - block
    b649 - block
    b101 - block
    b751 - block
    b517 - block
    b301 - block
    b305 - block
    b468 - block
    b247 - block
    b473 - block
    b712 - block
    b795 - block
    b694 - block
    b392 - block
    b169 - block
    b42 - block
    b83 - block
    b793 - block
    b2 - block
    b828 - block
    b866 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b110 )
    ( on b284 b110 )
    ( on b263 b284 )
    ( on b440 b263 )
    ( on b186 b440 )
    ( on b326 b186 )
    ( on b692 b326 )
    ( on b117 b692 )
    ( on b485 b117 )
    ( on b616 b485 )
    ( on b482 b616 )
    ( on b355 b482 )
    ( on b373 b355 )
    ( on b80 b373 )
    ( on b586 b80 )
    ( on b146 b586 )
    ( on b761 b146 )
    ( on b405 b761 )
    ( on b706 b405 )
    ( on b515 b706 )
    ( on b976 b515 )
    ( on b906 b976 )
    ( on b914 b906 )
    ( on b488 b914 )
    ( on b379 b488 )
    ( on b837 b379 )
    ( on b892 b837 )
    ( on b854 b892 )
    ( on b649 b854 )
    ( on b101 b649 )
    ( on b751 b101 )
    ( on b517 b751 )
    ( on b301 b517 )
    ( on b305 b301 )
    ( on b468 b305 )
    ( on b247 b468 )
    ( on b473 b247 )
    ( on b712 b473 )
    ( on b795 b712 )
    ( on b694 b795 )
    ( on b392 b694 )
    ( on b169 b392 )
    ( on b42 b169 )
    ( on b83 b42 )
    ( on b793 b83 )
    ( on b2 b793 )
    ( on b828 b2 )
    ( on b866 b828 )
    ( clear b866 )
  )
  ( :goal
    ( and
      ( clear b110 )
    )
  )
)
