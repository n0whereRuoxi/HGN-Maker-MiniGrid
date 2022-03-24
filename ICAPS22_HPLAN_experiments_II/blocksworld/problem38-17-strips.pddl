( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b266 - block
    b244 - block
    b448 - block
    b721 - block
    b131 - block
    b225 - block
    b546 - block
    b397 - block
    b812 - block
    b943 - block
    b742 - block
    b631 - block
    b93 - block
    b916 - block
    b672 - block
    b542 - block
    b515 - block
    b284 - block
    b16 - block
    b779 - block
    b987 - block
    b263 - block
    b189 - block
    b689 - block
    b683 - block
    b607 - block
    b379 - block
    b780 - block
    b883 - block
    b441 - block
    b405 - block
    b731 - block
    b898 - block
    b660 - block
    b90 - block
    b129 - block
    b676 - block
    b110 - block
    b203 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b266 )
    ( on b244 b266 )
    ( on b448 b244 )
    ( on b721 b448 )
    ( on b131 b721 )
    ( on b225 b131 )
    ( on b546 b225 )
    ( on b397 b546 )
    ( on b812 b397 )
    ( on b943 b812 )
    ( on b742 b943 )
    ( on b631 b742 )
    ( on b93 b631 )
    ( on b916 b93 )
    ( on b672 b916 )
    ( on b542 b672 )
    ( on b515 b542 )
    ( on b284 b515 )
    ( on b16 b284 )
    ( on b779 b16 )
    ( on b987 b779 )
    ( on b263 b987 )
    ( on b189 b263 )
    ( on b689 b189 )
    ( on b683 b689 )
    ( on b607 b683 )
    ( on b379 b607 )
    ( on b780 b379 )
    ( on b883 b780 )
    ( on b441 b883 )
    ( on b405 b441 )
    ( on b731 b405 )
    ( on b898 b731 )
    ( on b660 b898 )
    ( on b90 b660 )
    ( on b129 b90 )
    ( on b676 b129 )
    ( on b110 b676 )
    ( on b203 b110 )
    ( clear b203 )
  )
  ( :goal
    ( and
      ( clear b266 )
    )
  )
)
