#!/usr/bin/env bash
#MISE description="Lists and optionally uninstall unused mise tools"
#USAGE flag "-u --uninstall" help="If present uninstall unused tools instead of just listing them"

#
# Copyright © 2026 Eduardo Camaratta
#
# This file is part of Prompt Config.
#
# Prompt Config is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#
# Prompt Config is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License along with Prompt Config. If not, see <https://www.gnu.org/licenses/>.
#

mise ls --prunable;
if [ "${usage_uninstall:-false}" = "true" ]; then
    TOOLS_TO_UNINSTALL=$(mise ls --prunable --json | jq -r 'to_entries[] | .key + "@" + .value[].version');
    if [[ $TOOLS_TO_UNINSTALL != "" ]]; then
        mise uninstall $TOOLS_TO_UNINSTALL;
    else
        echo "No tools to uninstall";
    fi
fi