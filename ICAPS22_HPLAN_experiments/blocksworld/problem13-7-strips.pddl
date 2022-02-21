( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b689 - block
    b840 - block
    b225 - block
    b541 - block
    b618 - block
    b670 - block
    b413 - block
    b214 - block
    b502 - block
    b596 - block
    b706 - block
    b231 - block
    b68 - block
    b565 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b689 )
    ( on b840 b689 )
    ( on b225 b840 )
    ( on b541 b225 )
    ( on b618 b541 )
    ( on b670 b618 )
    ( on b413 b670 )
    ( on b214 b413 )
    ( on b502 b214 )
    ( on b596 b502 )
    ( on b706 b596 )
    ( on b231 b706 )
    ( on b68 b231 )
    ( on b565 b68 )
    ( clear b565 )
  )
  ( :goal
    ( and
      ( clear b689 )
    )
  )
)
