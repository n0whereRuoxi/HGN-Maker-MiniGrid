( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b365 - block
    b498 - block
    b455 - block
    b872 - block
    b542 - block
    b271 - block
    b426 - block
    b53 - block
    b318 - block
    b376 - block
    b593 - block
    b776 - block
    b479 - block
    b239 - block
    b70 - block
    b397 - block
    b558 - block
    b304 - block
    b493 - block
    b581 - block
    b728 - block
    b887 - block
    b663 - block
    b182 - block
    b142 - block
    b127 - block
    b473 - block
    b577 - block
    b618 - block
    b421 - block
    b55 - block
    b408 - block
    b836 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b365 )
    ( on b498 b365 )
    ( on b455 b498 )
    ( on b872 b455 )
    ( on b542 b872 )
    ( on b271 b542 )
    ( on b426 b271 )
    ( on b53 b426 )
    ( on b318 b53 )
    ( on b376 b318 )
    ( on b593 b376 )
    ( on b776 b593 )
    ( on b479 b776 )
    ( on b239 b479 )
    ( on b70 b239 )
    ( on b397 b70 )
    ( on b558 b397 )
    ( on b304 b558 )
    ( on b493 b304 )
    ( on b581 b493 )
    ( on b728 b581 )
    ( on b887 b728 )
    ( on b663 b887 )
    ( on b182 b663 )
    ( on b142 b182 )
    ( on b127 b142 )
    ( on b473 b127 )
    ( on b577 b473 )
    ( on b618 b577 )
    ( on b421 b618 )
    ( on b55 b421 )
    ( on b408 b55 )
    ( on b836 b408 )
    ( clear b836 )
  )
  ( :goal
    ( and
      ( clear b365 )
    )
  )
)
