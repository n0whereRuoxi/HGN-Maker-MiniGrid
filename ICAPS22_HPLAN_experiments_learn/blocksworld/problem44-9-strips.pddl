( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b317 - block
    b401 - block
    b466 - block
    b470 - block
    b20 - block
    b366 - block
    b949 - block
    b819 - block
    b574 - block
    b292 - block
    b409 - block
    b884 - block
    b56 - block
    b579 - block
    b287 - block
    b376 - block
    b105 - block
    b453 - block
    b961 - block
    b97 - block
    b929 - block
    b570 - block
    b647 - block
    b13 - block
    b689 - block
    b697 - block
    b3 - block
    b590 - block
    b154 - block
    b186 - block
    b240 - block
    b987 - block
    b502 - block
    b232 - block
    b893 - block
    b271 - block
    b308 - block
    b455 - block
    b553 - block
    b83 - block
    b282 - block
    b183 - block
    b865 - block
    b68 - block
    b760 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b317 )
    ( on b401 b317 )
    ( on b466 b401 )
    ( on b470 b466 )
    ( on b20 b470 )
    ( on b366 b20 )
    ( on b949 b366 )
    ( on b819 b949 )
    ( on b574 b819 )
    ( on b292 b574 )
    ( on b409 b292 )
    ( on b884 b409 )
    ( on b56 b884 )
    ( on b579 b56 )
    ( on b287 b579 )
    ( on b376 b287 )
    ( on b105 b376 )
    ( on b453 b105 )
    ( on b961 b453 )
    ( on b97 b961 )
    ( on b929 b97 )
    ( on b570 b929 )
    ( on b647 b570 )
    ( on b13 b647 )
    ( on b689 b13 )
    ( on b697 b689 )
    ( on b3 b697 )
    ( on b590 b3 )
    ( on b154 b590 )
    ( on b186 b154 )
    ( on b240 b186 )
    ( on b987 b240 )
    ( on b502 b987 )
    ( on b232 b502 )
    ( on b893 b232 )
    ( on b271 b893 )
    ( on b308 b271 )
    ( on b455 b308 )
    ( on b553 b455 )
    ( on b83 b553 )
    ( on b282 b83 )
    ( on b183 b282 )
    ( on b865 b183 )
    ( on b68 b865 )
    ( on b760 b68 )
    ( clear b760 )
  )
  ( :goal
    ( and
      ( clear b317 )
    )
  )
)
