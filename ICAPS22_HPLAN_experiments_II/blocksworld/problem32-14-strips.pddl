( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b573 - block
    b391 - block
    b515 - block
    b862 - block
    b243 - block
    b14 - block
    b326 - block
    b118 - block
    b915 - block
    b894 - block
    b897 - block
    b684 - block
    b530 - block
    b68 - block
    b866 - block
    b545 - block
    b158 - block
    b218 - block
    b661 - block
    b865 - block
    b958 - block
    b913 - block
    b940 - block
    b99 - block
    b177 - block
    b418 - block
    b78 - block
    b517 - block
    b613 - block
    b951 - block
    b166 - block
    b995 - block
    b440 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b573 )
    ( on b391 b573 )
    ( on b515 b391 )
    ( on b862 b515 )
    ( on b243 b862 )
    ( on b14 b243 )
    ( on b326 b14 )
    ( on b118 b326 )
    ( on b915 b118 )
    ( on b894 b915 )
    ( on b897 b894 )
    ( on b684 b897 )
    ( on b530 b684 )
    ( on b68 b530 )
    ( on b866 b68 )
    ( on b545 b866 )
    ( on b158 b545 )
    ( on b218 b158 )
    ( on b661 b218 )
    ( on b865 b661 )
    ( on b958 b865 )
    ( on b913 b958 )
    ( on b940 b913 )
    ( on b99 b940 )
    ( on b177 b99 )
    ( on b418 b177 )
    ( on b78 b418 )
    ( on b517 b78 )
    ( on b613 b517 )
    ( on b951 b613 )
    ( on b166 b951 )
    ( on b995 b166 )
    ( on b440 b995 )
    ( clear b440 )
  )
  ( :goal
    ( and
      ( clear b573 )
    )
  )
)
