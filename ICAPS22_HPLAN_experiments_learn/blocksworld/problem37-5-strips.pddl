( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b891 - block
    b689 - block
    b906 - block
    b257 - block
    b60 - block
    b577 - block
    b62 - block
    b694 - block
    b53 - block
    b3 - block
    b815 - block
    b221 - block
    b428 - block
    b321 - block
    b565 - block
    b968 - block
    b756 - block
    b393 - block
    b919 - block
    b348 - block
    b887 - block
    b358 - block
    b214 - block
    b170 - block
    b480 - block
    b629 - block
    b653 - block
    b98 - block
    b510 - block
    b960 - block
    b772 - block
    b503 - block
    b291 - block
    b382 - block
    b886 - block
    b534 - block
    b423 - block
    b316 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b891 )
    ( on b689 b891 )
    ( on b906 b689 )
    ( on b257 b906 )
    ( on b60 b257 )
    ( on b577 b60 )
    ( on b62 b577 )
    ( on b694 b62 )
    ( on b53 b694 )
    ( on b3 b53 )
    ( on b815 b3 )
    ( on b221 b815 )
    ( on b428 b221 )
    ( on b321 b428 )
    ( on b565 b321 )
    ( on b968 b565 )
    ( on b756 b968 )
    ( on b393 b756 )
    ( on b919 b393 )
    ( on b348 b919 )
    ( on b887 b348 )
    ( on b358 b887 )
    ( on b214 b358 )
    ( on b170 b214 )
    ( on b480 b170 )
    ( on b629 b480 )
    ( on b653 b629 )
    ( on b98 b653 )
    ( on b510 b98 )
    ( on b960 b510 )
    ( on b772 b960 )
    ( on b503 b772 )
    ( on b291 b503 )
    ( on b382 b291 )
    ( on b886 b382 )
    ( on b534 b886 )
    ( on b423 b534 )
    ( on b316 b423 )
    ( clear b316 )
  )
  ( :goal
    ( and
      ( clear b891 )
    )
  )
)
