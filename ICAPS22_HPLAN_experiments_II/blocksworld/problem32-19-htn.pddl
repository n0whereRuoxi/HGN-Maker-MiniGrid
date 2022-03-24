( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b846 - block
    b675 - block
    b964 - block
    b98 - block
    b456 - block
    b720 - block
    b689 - block
    b280 - block
    b479 - block
    b407 - block
    b645 - block
    b13 - block
    b789 - block
    b622 - block
    b196 - block
    b584 - block
    b235 - block
    b178 - block
    b727 - block
    b866 - block
    b259 - block
    b719 - block
    b296 - block
    b881 - block
    b511 - block
    b994 - block
    b149 - block
    b892 - block
    b486 - block
    b856 - block
    b677 - block
    b176 - block
    b430 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b846 )
    ( on b675 b846 )
    ( on b964 b675 )
    ( on b98 b964 )
    ( on b456 b98 )
    ( on b720 b456 )
    ( on b689 b720 )
    ( on b280 b689 )
    ( on b479 b280 )
    ( on b407 b479 )
    ( on b645 b407 )
    ( on b13 b645 )
    ( on b789 b13 )
    ( on b622 b789 )
    ( on b196 b622 )
    ( on b584 b196 )
    ( on b235 b584 )
    ( on b178 b235 )
    ( on b727 b178 )
    ( on b866 b727 )
    ( on b259 b866 )
    ( on b719 b259 )
    ( on b296 b719 )
    ( on b881 b296 )
    ( on b511 b881 )
    ( on b994 b511 )
    ( on b149 b994 )
    ( on b892 b149 )
    ( on b486 b892 )
    ( on b856 b486 )
    ( on b677 b856 )
    ( on b176 b677 )
    ( on b430 b176 )
    ( clear b430 )
  )
  ( :tasks
    ( Make-32Pile b675 b964 b98 b456 b720 b689 b280 b479 b407 b645 b13 b789 b622 b196 b584 b235 b178 b727 b866 b259 b719 b296 b881 b511 b994 b149 b892 b486 b856 b677 b176 b430 )
  )
)
